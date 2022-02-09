def square(num):
    x1 = num / 2
    x2 = (x1 + (num / x1)) // 2
    while(x1 - x2 >= 1):
        x1 = x2
        x2 = (x1 + (num / x1)) // 2
    return x2

if __name__ == "__main__":
    print(square(144))
