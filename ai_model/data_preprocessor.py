import yfinance as yf
import pandas as pd

def get_stock_data(ticker, start_date, end_date):
    """Fetches stock data from Yahoo Finance."""
    stock_data = yf.download(ticker, start=start_date, end=end_date)
    stock_data.columns = ['Open', 'High', 'Low', 'Close', 'Volume']
    return stock_data

def calculate_rsi(data, window=14):
    """Calculates the Relative Strength Index (RSI)."""
    delta = data['Close'].diff()
    gain = (delta.where(delta > 0, 0)).rolling(window=window).mean()
    loss = (-delta.where(delta < 0, 0)).rolling(window=window).mean()
    rs = gain / loss
    rsi = 100 - (100 / (1 + rs))
    return rsi

def calculate_macd(data, slow=26, fast=12, signal=9):
    """Calculates the Moving Average Convergence Divergence (MACD)."""
    exp1 = data['Close'].ewm(span=fast, adjust=False).mean()
    exp2 = data['Close'].ewm(span=slow, adjust=False).mean()
    macd = exp1 - exp2
    signal_line = macd.ewm(span=signal, adjust=False).mean()
    return macd, signal_line

if __name__ == '__main__':
    tickers = ['005930.KS', '000660.KS', '373220.KS', '005380.KS', '035720.KS']
    start_date = '2015-01-01'
    end_date = '2025-01-01'

    for ticker in tickers:
        print(f"Fetching data for {ticker}...")
        stock_data = get_stock_data(ticker, start_date, end_date)

        # Calculate technical indicators
        stock_data['RSI'] = calculate_rsi(stock_data)
        stock_data['MACD'], stock_data['MACD_Signal'] = calculate_macd(stock_data)

        # Drop rows with NaN values
        stock_data.dropna(inplace=True)

        # Save to CSV
        output_path = f'./{ticker.replace(".KS", "")}_data.csv'
        stock_data.to_csv(output_path, index=False)
        print(f"Data for {ticker} saved to {output_path}")
