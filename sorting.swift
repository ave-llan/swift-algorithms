extension Array {

  mutating func swap (i: Int, _ j: Int) {
    let temp = self[i]; self[i] = self[j]; self[j] = temp
  }

  func insertionSort (isOrderedBefore: (Element, Element) -> Bool) -> [Element] {
    var array = self
    guard array.count > 1 else {
      return array
    }
    for j in 1..<array.count {
      var i = j - 1
      while i >= 0 && isOrderedBefore(array[i+1], array[i]) {
        array.swap(i, i + 1)
        i -= 1
      }
    }

    return array
  }

}
