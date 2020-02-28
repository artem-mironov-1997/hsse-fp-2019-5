object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println(balance(List(')','(', '(', ')', ')', '(')))
    println(countChange(13, List(5, 3, 2)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (r == 0 || c == 0 || c == r) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {

    def checkBalance(brackets: List[Char], cntr: Int): Boolean = {
      if (cntr < 0) return false
      if (brackets.size == 0) {
        return cntr == 0
      }
      return checkBalance(brackets.slice(1, brackets.size), cntr + (if (brackets.apply(0) == '(') 1 else -1))
    }

    return checkBalance(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {

    def countNVars(summ: Int, numCoin: Int): Int = {
      if (summ > money) return 0
      if (summ == money) return 1

      // Calculating sum of resursive function results for all coins from the current numCoin
      // map applies countNVar function to coins' indexes list
      // Each recursive call accumulates summ of money
      // The cost of the next coin during calculation is not greater than current coin (to avoid odd repeats of counting)

      return (numCoin to coins.size-1).map(i => countNVars(summ + coins.apply(i), i)).reduce(_ + _)
    }

    countNVars(0, 0)
  }
}