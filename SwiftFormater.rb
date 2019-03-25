require './LinkedList'

def format(file_name)
  import_key = "import"
  mark_key = "MARK"
  class_key = "class"
  fun_key = "func"
  outlet_key = "@IBOutlet"
  action_key = "@IBAction"
  private_key = "private"
  file_private_key = "fileprivate"

  self_init = "self.init"
  super_init = "super.init"
  init_key = "init"

  file_data = File.readlines(file_name)

  out_data = []
  list = LinkedList.new

  file_data.each do |line|
    list.append(line)
  end

  current_line = list.head
  while current_line != nil


    previous = current_line.previous
    _next = current_line.next
    current_value = current_line.value.to_s

    if previous != nil and
        current_value.include? import_key and
        previous.value.to_s.include? import_key and
        !_next.value.to_s.include? import_key

      out_data.push(current_value)
      out_data.push("\n")

    elsif current_value.include? class_key
      out_data.push(current_value)
      out_data.push("\n")

    elsif current_value.include? mark_key
      out_data.push("\n")
      out_data.push(current_value)

    elsif current_value.include? fun_key and previous != nil and !previous.value.to_s.include? mark_key and
        previous != nil and !previous.value.to_s.include? action_key and previous.value.to_s.strip.gsub(/\s+/, "") != 0
      out_data.push("\n")
      out_data.push(current_value)

    elsif current_value.strip.gsub(/\s+/, "") == outlet_key && _next != nil
      if _next.value.to_s.include? private_key
        value = _next.value.to_s.sub! private_key, outlet_key + " " + private_key
        out_data.push(value)
      elsif _next.value.to_s.include? file_private_key
        value = _next.value.to_s.sub! file_private_key, outlet_key + " " + file_private_key
        out_data.push(value)
      end

    elsif current_value.to_s.include? init_key and
        (!current_value.to_s.include? self_init and !current_value.to_s.include? super_init) and
        previous != nil and !previous.value.to_s.include? init_key and !previous.value.to_s.include? mark_key
      out_data.push("\n")
      out_data.push(current_value.to_s)

    elsif current_value.strip.gsub(/\s+/, "") == action_key && _next != nil
      if _next.value.to_s.include? private_key
        value = _next.value.to_s.sub! private_key, (action_key + " " + private_key)
        if previous != nil and
            previous.value.to_s.strip.gsub(/\s+/, "") != 0 and
            !previous.value.to_s.include? action_key and
            !previous.value.to_s.include? mark_key
          out_data.push("\n")
        end
        out_data.push(value)

      elsif _next.value.to_s.include? file_private_key
        value = _next.value.to_s.sub! file_private_key, (action_key + " " + file_private_key)
        if previous != nil and previous.value.to_s.strip.gsub(/\s+/, "") != 0 and !previous.value.to_s.include? mark_key
          out_data.push("\n")
        end
        out_data.push(value)
      end

    elsif current_value.strip.gsub(/\s+/, "").length != 0
      if (previous != nil and previous.value.to_s.strip.gsub(/\s+/, "") != outlet_key) and (previous != nil and previous.value.to_s.strip.gsub(/\s+/, "") != action_key)
        out_data.push(current_value)
      end
    end

    current_line = current_line.next
  end

  out_file = File.open(file_name, 'w')
  out_data.each() do |line|
    out_file.puts line
  end

  puts "Your file is formatted..."
end


def openFile(path)
  Dir.foreach(path) do |file|
    if file.to_s.include? ".swift"
      format(path + "/" + file)
    end
  end
end

path = ARGV.first
openFile(path)