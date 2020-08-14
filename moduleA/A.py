import pandas as pd
import os


def func():
    current_dirname = os.path.dirname(__file__)
    df = pd.read_csv(current_dirname + "/data.csv")
    # df = pd.read_csv("data.csv")
    print(df)


if __name__ == '__main__':
    func()
