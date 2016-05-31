extension Array {

  // uses binary search to find the lowest possible insertion index for an element
  // in a sorted array
  func orderedIndexFor (newElement: Element, isOrderedBefore: (Element, Element) -> Bool) -> Int {

    var low = 0, high = count-1
    while low <= high {

      let mid = low + (high - low) / 2

      if isOrderedBefore(self[mid], newElement) {
        low = mid + 1
      } else {
        high = mid - 1
      }

    }
    return low
  }

}
