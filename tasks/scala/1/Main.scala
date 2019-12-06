package recfun


import scala.collection.mutable.ArrayBuffer

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println()
    println("Parentheses Balancing")
    val expression = "((x+(y+z))*3)+5"
    println(expression)
    println(balance(expression.toList))

    println()
    println("Counting Change")
    val coins = List[Int](2, 3)
    val money = 5
    println("Coins:", coins)
    println("Money:", money)
    println(countChange(money, coins))
  }

  /**
    * Exercise 1
    */
  def pascal(c: Int, r: Int): Int = {
    def factorial(n: Int, array: ArrayBuffer[Int]): Int = n match {
      case 0 => 1
      case 1 => 1
      case _ =>
        var result = n * factorial(n - 1, array)
        array += result
        result
    }

    val factorialsList = ArrayBuffer[Int](1, 1)
    factorial(scala.math.max(c, r), factorialsList)
    factorialsList(r) / (factorialsList(c) * factorialsList(r - c))
  }

  /**
    * Exercise 2 Parentheses Balancing
    */
  def balance(chars: List[Char]): Boolean = {
    def balance(chars: List[Char], count: Int): Boolean = {
      if (chars.isEmpty)
        return count == 0
      chars.head match {
        case '(' => balance(chars.tail, count + 1)
        case ')' => balance(chars.tail, count - 1)
        case _   => balance(chars.tail, count)
      }
    }

    balance(chars, 0)
  }


  /**
    * Exercise 3 Counting Change
    * Write a recursive function that counts how many different ways you can make
    * change for an amount, given a list of coin denominations. For example,
    * there is 1 way to give change for 5 if you have coins with denomination
    * 2 and 3: 2+3.
    */
  def countChange(money: Int, coins: List[Int]): Int = {
    def countChange(money: Int, coins: List[Int], count: Int): Int = {
      if (money < 0) {
        count
      } else {
        if (coins.isEmpty)
          if (money == 0) {
            count + 1
          } else {
            count
          }
        else {
          countChange(money - coins.head, coins, count) + countChange(money, coins.tail, count)
        }
      }
    }
    countChange(money, coins, 0)
  }
}