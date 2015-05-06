class Hash

  def hmap(&prc)
    self.map { |k, v| [k, prc.call(v)] }
    .to_h
  end
end
