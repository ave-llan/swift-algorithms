extension Array {
  mutating func swap (i: Int, _ j: Int) {
    let temp = self[i]; self[i] = self[j]; self[j] = temp
  }
}
