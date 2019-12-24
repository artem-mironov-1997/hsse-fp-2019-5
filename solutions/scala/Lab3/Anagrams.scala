package forcomp

object Anagrams {

  
  type Occurrences = List[(Char, Int)]

  val dictionary: List[Word] = loadDictionary

 
  def wordOccurrences(w: Word): Occurrences = {
    val orderedLowerCaseList: List[Char] = w.toLowerCase.sorted.toList
    val characterFrequency: List[Int] =
      for (letter <- orderedLowerCaseList.distinct)
        yield (orderedLowerCaseList filter (l => l == letter)).length
    orderedLowerCaseList.distinct zip characterFrequency
  }

   def sentenceOccurrences(s: Sentence): Occurrences = wordOccurrences(s.mkString)

  
  lazy val dictionaryByOccurrences: Map[Occurrences, List[Word]] = dictionary groupBy (word => wordOccurrences(word))

  def wordAnagrams(word: Word): List[Word] = dictionaryByOccurrences(wordOccurrences(word))

  def combinations(occurrences: Occurrences): List[Occurrences] = occurrences match {
    case Nil => List(List())
    case o :: oo => generator(listMaker(o), combinations(oo))
  }

  def listMaker(occ: (Char, Int)): List[Occurrences] = {
    val newVector = for (index <- 1 to occ._2) yield (occ._1, index)
    (for (index <- 0 until newVector.length) yield newVector(index) :: Nil).toList ::: List(Nil)
  }

  def generator(occ1: List[Occurrences], occ0: List[Occurrences]): List[Occurrences] =
    for (o1 <- occ1; o0 <- occ0) yield o1 ::: o0

  def subtract(x: Occurrences, y: Occurrences): Occurrences = {
    def subtract0(x0: Occurrences, y0: Occurrences): Occurrences = y0 match {
      case Nil => x0
      case y :: yy =>
        val (xChar, xInt) = x0.unzip
        val (yChar, yInt) = y0.unzip
        val index = xChar.indexOf(yChar.head)
        val xNew: List[(Char, Int)] = xChar.zip(xInt.updated(index, xInt(index) - yInt.head))
        subtract0(xNew, yy)
    }
    subtract0(x, y) flatMap dropZero
  }

  def dropZero(elem: (Char, Int)): List[(Char, Int)] = elem match {
    case (char, 0) => Nil
    case (char, int) => List((char, int))
  }

 def sentenceAnagrams(sentence: Sentence): List[Sentence] = {
    def sentenceAnagramsHelper(occurrences: Occurrences, accumulator: List[Sentence]): List[Sentence] =
      if (occurrences.isEmpty) accumulator
      else {
        (for {
          elem <- combinations(occurrences) filter isWord
          wordAnagram <- (dictionaryByOccurrences get elem).toList.head
        } yield sentenceAnagramsHelper(subtract(occurrences, elem), accumulator.map(List(wordAnagram) ::: _))
          ).flatten
      }
    sentenceAnagramsHelper(sentenceOccurrences(sentence), List(List()))
  }

  def isWord(occurrences: Occurrences): Boolean = !(dictionaryByOccurrences get occurrences).isEmpty

}