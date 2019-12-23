

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println("balance parentheses for ())))() is:" + balance("())))()".toList))

    println("countChange for 53 with [1,5,10,20,50] is: " + countChange(53, List(5,10,20,1,50)))
  }

  /**
    * Exercise 1
    */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) {
      return 1;
    }
    pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
    * Exercise 2
    */
  def balance(chars: List[Char]): Boolean = {
    def f(chars: List[Char], numOpens: Int): Boolean = chars match {
      case Nil => numOpens == 0
      case head :: tail => {
        if (head == '(') f(tail, numOpens + 1)
        else if (head == ')') {
          if (numOpens > 0)
            f(tail, numOpens - 1)
          else
            false
        } else {
          f(tail, numOpens)
        }
      }
    }

    f(chars, 0)
  }

  /**
    * Exercise 3
    */
  def countChange(money: Int, coins: List[Int]): Int = {
    def f(money: Int, coins: List[Int], count: Int): Int = {
      var newCount = count
      if (money == 0) return newCount + 1
      if (coins.length == 0) return newCount

      for (changes <- coins) {
        if (money - changes >= 0) {
          if (money - changes >= changes) {
            newCount = f(money - changes, coins.drop(coins.indexOf(changes)), newCount)
          } else {
            newCount = f(money - changes, coins.tail, newCount)
          }
        }
      }
      newCount
    }

    f(money, coins.sorted.reverse, 0)

  }
}