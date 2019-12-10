import scala.collection.immutable._ 

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
    if (c == 0 || r == c) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
   def pascal(c: Int, r: Int): Int = {
    if (r < 0 || c < 0 || c > r) 0
    else if (c == 0 || c == r) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
def balance(chars: List[Char]): Boolean = {
    def f(chars: List[Char], num: Int): Boolean = {
      (chars,num) match {
        case (Nil,num) => return num == 0
        case (c :: tail,num) =>
          if(num < 0) return false
          if(c == '(') return f(tail,num+1)
          if(c == ')') return f(tail,num-1)
          else return f(tail,num)
      }
    }
    f(chars,0)
  }
  
  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money == 0) 1
    else if (money < 0) 0
    else if (coins.isEmpty) 0
    else countChange(money - coins.head, coins) + countChange(money, coins.tail)
  }
