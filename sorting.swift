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


  func mergeSort (isOrderedBefore: (Element, Element) -> Bool) -> [Element] {

    guard count > 1 else { return self } // trivially sorted

    let mid = self.count / 2
    return merge(
      Array(self[0..<mid]).mergeSort(isOrderedBefore),
      Array(self[mid..<endIndex]).mergeSort(isOrderedBefore),
      isOrderedBefore)
  }

  private func merge (left: [Element], _ right: [Element], _ isOrderedBefore: (Element, Element) -> Bool) -> [Element] {

    var merged = [Element](), left = left, right = right
    while !left.isEmpty && !right.isEmpty {
      isOrderedBefore(left[0], right[0]) ? merged.append(left.removeFirst())
                                         : merged.append(right.removeFirst())
    }

    if !left.isEmpty  { merged.appendContentsOf(left) }
    if !right.isEmpty { merged.appendContentsOf(right) }

    return merged
  }


}