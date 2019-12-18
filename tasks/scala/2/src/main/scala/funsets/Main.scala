package funsets

object Main extends App {
  import FunSets._
  val lhsEntrySet = singletonSet(1)
  val rhsEntrySet = singletonSet(2)
  val testTest = union(lhsEntrySet, rhsEntrySet)
}
