//package recfun
//import common._

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    var listChars = List('(', '(', ')', ')')
    println("Parentheses Balancing: " + listChars)
    println(balance(listChars))

    listChars = List('(', '(', ')')
    println("Parentheses Balancing: " + listChars)
    println(balance(listChars))

    println("Counting change")
    var l = List(1,2,3,4,5,10)
    println(countChange(10, l))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c < 0 || r < 0 || c > r ) throw new IllegalArgumentException("") else {
      if (c == 0 || c == r) {
        return 1
      } else {
        pascal(c -1, r - 1) + pascal(c, r - 1)
      }
    }
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def parenthesesChecking(chars: List[Char], openedBrackets: Int): Boolean = {
      if (chars.isEmpty) {
        openedBrackets == 0
      } else if(chars.head == '(') {
        parenthesesChecking(chars.tail, openedBrackets + 1)
      } else if (chars.head == ')') {
        (openedBrackets > 0) && parenthesesChecking(chars.tail, openedBrackets - 1)
      } else {
        parenthesesChecking(chars.tail, openedBrackets)
      }
    }
    parenthesesChecking(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money == 0) {
      return 1
    } else if ((money < 0) || coins.isEmpty) {
      return 0
    } else {
      countChange(money - coins.head, coins) + countChange(money, coins.tail)
    }
  }
}
