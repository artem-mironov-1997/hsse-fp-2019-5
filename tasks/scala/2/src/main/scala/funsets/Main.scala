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
  val lhsAndRhsIntersect = intersect(lhsUnion, rhsUnion)
  println(s"Intersect between ${FunSets.toString(lhsUnion)} and ${FunSets.toString(rhsUnion)} is: ${FunSets.toString(lhsAndRhsIntersect)}")

  var lhsAndRhsDifference = diff(lhsUnion, rhsUnion)
  println(s"Difference between ${FunSets.toString(lhsUnion)} and ${FunSets.toString(rhsUnion)} is: ${FunSets.toString(lhsAndRhsDifference)}")

  var lhsAndRhsFiltered = filter(lhsUnion, rhsUnion)
  println(s"${FunSets.toString(lhsUnion)} filtred by ${FunSets.toString(rhsUnion)} is ${FunSets.toString(lhsAndRhsFiltered)}")

  val doesSetContainOnlyPositiveNumbers = exists(lhsUnion, entry => entry > 0)
  println(s"Does set ${FunSets.toString(lhsUnion)} contains only positive numbers? ${doesSetContainOnlyPositiveNumbers}")

  val multipliedLhsSet = map(lhsUnion, entry => entry * 2)
  println(s"Set ${FunSets.toString(lhsUnion)} multiplied by 2 is: ${FunSets.toString(multipliedLhsSet)}")
}
