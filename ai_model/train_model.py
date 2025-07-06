import pandas as pd
import numpy as np
import torch
import torch.nn as nn
from sklearn.preprocessing import MinMaxScaler

# Define the LSTM model
class LSTMModel(nn.Module):
    def __init__(self, input_size=1, hidden_layer_size=100, output_size=1):
        super().__init__()
        self.hidden_layer_size = hidden_layer_size

        self.lstm = nn.LSTM(input_size, hidden_layer_size)

        self.linear = nn.Linear(hidden_layer_size, output_size)

        self.hidden_cell = (torch.zeros(1,1,self.hidden_layer_size),
                            torch.zeros(1,1,self.hidden_layer_size))

    def forward(self, input_seq):
        lstm_out, self.hidden_cell = self.lstm(input_seq.view(len(input_seq) ,1, -1), self.hidden_cell)
        predictions = self.linear(lstm_out.view(len(input_seq), -1))
        return predictions[-1]

# Function to create sequences
def create_inout_sequences(input_data, tw):
    inout_seq = []
    L = len(input_data)
    for i in range(L-tw):
        train_seq = input_data[i:i+tw]
        train_label = input_data[i+tw:i+tw+1]
        inout_seq.append((train_seq ,train_label))
    return inout_seq

if __name__ == '__main__':
    tickers = ['005930', '000660', '373220', '005380', '035720']
    
    for ticker in tickers:
        print(f"Training model for {ticker}...")
        # Load data
        data = pd.read_csv(f'./{ticker}_data.csv')
        all_data = data['Close'].values.astype(float)

        # Normalize data
        scaler = MinMaxScaler(feature_range=(-1, 1))
        all_data_normalized = scaler.fit_transform(all_data .reshape(-1, 1))
        all_data_normalized = torch.FloatTensor(all_data_normalized).view(-1)

        # Create sequences
        train_window = 12
        train_inout_seq = create_inout_sequences(all_data_normalized, train_window)

        # Instantiate model
        model = LSTMModel()
        loss_function = nn.MSELoss()
        optimizer = torch.optim.Adam(model.parameters(), lr=0.001)

        # Train model
        epochs = 10

        for i in range(epochs):
            for seq, labels in train_inout_seq:
                optimizer.zero_grad()
                model.hidden_cell = (torch.zeros(1, 1, model.hidden_layer_size),
                                torch.zeros(1, 1, model.hidden_layer_size))

                y_pred = model(seq)

                single_loss = loss_function(y_pred, labels)
                single_loss.backward()
                optimizer.step()

            if i%25 == 1:
                print(f'epoch: {i:3} loss: {single_loss.item():10.8f}')

        print(f'epoch: {i:3} loss: {single_loss.item():10.10f}')

        # Save model
        torch.save(model.state_dict(), f'./{ticker}_model.pt')
        print(f"Model for {ticker} saved to ./{ticker}_model.pt")
