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
    println("Parentheses Balancing")
    println(balance("((a+b)*(a-b)+c)-(a-b))".toList)) // true
    println(balance("((a+b)*(a-b)+c)-(a-b)".toList)) // false
    println("Count change")
    println(countChange(5, List(2,3))) // 1 way
  }

  /**
   * Exercise 1
   * Функция возвращающая значение элемента треугольника Паскаля по номеру колонки и строки
   */
  def pascal(c: Int, r: Int): Int = {
    if ((c == 0) || (c == r))  1; else pascal(c, r - 1) + pascal(c - 1, r - 1);
  }

  /**
   * Exercise 2 Parentheses Balancing
   * функция, подсчитывающая баланс скобок в выражении (по открытым и закрытым скобкам)
   */
  def balance(chars: List[Char]): Boolean = {
    chars.count(_ == '(') == chars.count(_ == ')')
  }  

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   * функция, определяющая количество возможных вариантов размена суммы (money) монетами номиналом (coins)
  */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (coins.isEmpty || (money - coins.head < 0)) 0
    else if (money - coins.head == 0) 1
    else countChange(money, coins.tail) + countChange(money - coins.head, coins) 
  }
}
