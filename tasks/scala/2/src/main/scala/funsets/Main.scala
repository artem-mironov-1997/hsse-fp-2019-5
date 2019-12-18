package funsets
import funsets.FunSets.toString

object Main extends App {
  import FunSets._
  val lhsEntrySet = singletonSet(5)
  val rhsEntrySet = singletonSet(2)
  val createdUnion = union(lhsEntrySet, rhsEntrySet)
  println(s"Union between ${FunSets.toString(lhsEntrySet)} and ${FunSets.toString(rhsEntrySet)} is: ${FunSets.toString(createdUnion)}")

  var additionalSet = singletonSet(3)
  var lhsUnion = union(additionalSet, lhsEntrySet)
  var rhsUnion = union(additionalSet, rhsEntrySet)
  val createdIntersect = intersect(lhsUnion, rhsUnion)
  println(s"Intersect between ${FunSets.toString(lhsUnion)} and ${FunSets.toString(rhsUnion)} is: ${FunSets.toString(createdIntersect)}")
}
