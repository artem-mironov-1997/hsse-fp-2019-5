package recfun
import common._

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
        println(balance(List('(')))
    println(balance(List('(', ')')))
    println(countChange(10, List(5,2,1)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
        if (c == 0 || r == 0) 1
    else pascal(c - 1, r - 1) + pascal(c - 1, r)

  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    val counts = 0
    def loop(acc: Int, temp: List[Char]): Boolean = {
      if (acc < 0) false
      else if (temp.isEmpty && acc == 0) true
      else if (temp.isEmpty && acc > 0) false
      else if (temp.head == '(') loop(acc + 1, temp.tail)
      else if (temp.head == ')') loop(acc - 1, temp.tail)
      else loop(acc, temp.tail)
    }
    loop(counts,chars)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(m: Int, coin: List[Int]): Int = {
        case (_, x :: _) if (x == 0) => throw new IllegalArgumentException("Coin can not be equal 0");
    case (_, Nil) => 0
    case (tmp, _) if tmp < 0 => 0
    case (0, _) => 1
    case (tmp, _) => countChange(tmp, coins.tail) + countChange(tmp - coins.head, coins)
  }
