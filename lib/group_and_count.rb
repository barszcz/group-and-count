class Hash
  def hmap(&prc)
    map { |k, v| [k, prc.call(v)] }.to_h
  end
end

class Array
  def group_and_count(keys)
    return size if keys.empty?
    grouped = group_by { |el| el[keys.first] }
    grouped.hmap { |subarr| subarr.group_and_count(keys.drop(1)) }
  end
end