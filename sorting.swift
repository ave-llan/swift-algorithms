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
    var array = self

    func mergeSort (inout array: [Element], _ p: Int, _ r: Int) {
      if p < r {
        let q = (r - p) / 2
        mergeSort(&array, p, q)
        mergeSort(&array, q + 1, r)
        merge(&array, p, q, r)
      }

    }

    // assuming subarrays array[p..q] and array[q+1..r] are sorted
    // merges the subarrays so array[p..r] is sorted
    func merge (inout array: [Element], _ p: Int, _ q: Int, _ r: Int) {
      let left = array[p...q], right = array[p+1...r]
      var leftIndex = 0, rightIndex = 0

      for i in p...r {
        if rightIndex >= right.count {
          array[i] = left[leftIndex]
          leftIndex += 1
        } else if leftIndex >= left.count {
          array[i] = right[rightIndex]
          rightIndex += 1
        } else if isOrderedBefore(left[leftIndex], right[rightIndex]) {
          array[i] = left[leftIndex]
          leftIndex += 1
        } else {
          array[i] = right[rightIndex]
          rightIndex += 1
        }

      }
    }
    mergeSort(&array, 0, array.count - 1)
    return array
  }


}