object Rextester {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    val listChars = List('(', ')', '(', ')', '(', ')', ')')
    println("Balance parentheses: " + listChars)
    println(balance(listChars))

    val money = 7
    val coins = List(1, 2)
    println("Change: cash - " + money + ", coins - " + coins)
    println(countChange(money, coins))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r)
      1
    else
      pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    paranthesesBalanceIsHarmony(chars)
  }

  private def paranthesesBalanceIsHarmony(chars: List[Char], paranthesesCount: Int = 0): Boolean = {
    (chars, paranthesesCount) match {
      case (Nil, num) => num == 0
      case (ch :: tail, paranthesesCount) =>
        if (paranthesesCount < 0) false
        if (ch.toInt == 40) paranthesesBalanceIsHarmony(tail, paranthesesCount + 1)
        if (ch.toInt == 41) paranthesesBalanceIsHarmony(tail, paranthesesCount - 1)
        else paranthesesBalanceIsHarmony(tail, paranthesesCount)
    }
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (coins.isEmpty || money < 0)
      0
    else if (money == 0)
      1
    else
      countChange(money - coins.head, coins) + countChange(money, coins.tail)
  }
}
