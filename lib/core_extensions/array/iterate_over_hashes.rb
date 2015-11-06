require "rename_keys/version"

module CoreExtensions
  module Array
    module IterateOverHashes
      def rename_keys(mapping)
        result = []

        self.each_with_index do |element, index|
          if element.kind_of?(::Hash)
            result[index] = element.rename_keys(mapping)
          else
            result[index] = element
          end
        end

        result
      end
    end
  end
end

# Actually monkey-patch the Ruby core Array class
Array.include ::CoreExtensions::Array::IterateOverHashes
