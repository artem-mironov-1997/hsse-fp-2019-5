package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))
  val set1 = singletonSet(4)
  val set2 = singletonSet(8)
  val set3 = singletonSet(8)
  val set4 = union(set1, set3)

  printSet(union(set1,set2))
  printSet(map(set1, x => x + 4))
  printSet(intersect(set2, set3))
}
