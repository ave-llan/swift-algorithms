extension Array {

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
