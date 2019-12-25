package funsets

object Rextester {
  import FunSets._

  def main(args: Array[String]) {
    println(contains(singletonSet(1), 1))
  }
}
