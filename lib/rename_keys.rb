require "rename_keys/version"

# Code taken from answers to Stack Overflow about renaming hash keys.
# See: http://stackoverflow.com/questions/4137824/how-to-elegantly-rename-all-keys-in-a-hash-in-ruby
class Hash
  def rename_keys(mapping)
      result = {}
      self.map do |k, v|
        mapped_key = mapping[k] ? mapping[k] : k

        # If this entry is a deep/nested hash, recursively change key names.
        result[mapped_key] = v.kind_of?(Hash) ? v.rename_keys(mapping) : v

        result[mapped_key] = v.collect{ |obj| obj.rename_keys(mapping) if obj.kind_of?(Hash)} if v.kind_of?(Array)
      end

    # If used within a Rails project, allow reference by either symbol or string.
    result.respond_to?(:with_indifferent_access) ? result.with_indifferent_access : result
   end
end
