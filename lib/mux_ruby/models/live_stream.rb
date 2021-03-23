=begin
#Mux API

#Mux is how developers build online video. This API encompasses both Mux Video and Mux Data functionality to help you build your video-related projects better and faster than ever before. 

The version of the OpenAPI document: v1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.1

=end

require 'date'
require 'time'

module MuxRuby
  class LiveStream
    attr_accessor :id

    attr_accessor :created_at

    attr_accessor :stream_key

    attr_accessor :active_asset_id

    attr_accessor :recent_asset_ids

    attr_accessor :status

    attr_accessor :playback_ids

    attr_accessor :new_asset_settings

    attr_accessor :passthrough

    attr_accessor :reconnect_window

    attr_accessor :reduced_latency

    attr_accessor :simulcast_targets

    attr_accessor :test

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'created_at' => :'created_at',
        :'stream_key' => :'stream_key',
        :'active_asset_id' => :'active_asset_id',
        :'recent_asset_ids' => :'recent_asset_ids',
        :'status' => :'status',
        :'playback_ids' => :'playback_ids',
        :'new_asset_settings' => :'new_asset_settings',
        :'passthrough' => :'passthrough',
        :'reconnect_window' => :'reconnect_window',
        :'reduced_latency' => :'reduced_latency',
        :'simulcast_targets' => :'simulcast_targets',
        :'test' => :'test'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'created_at' => :'String',
        :'stream_key' => :'String',
        :'active_asset_id' => :'String',
        :'recent_asset_ids' => :'Array<String>',
        :'status' => :'String',
        :'playback_ids' => :'Array<PlaybackID>',
        :'new_asset_settings' => :'CreateAssetRequest',
        :'passthrough' => :'String',
        :'reconnect_window' => :'Float',
        :'reduced_latency' => :'Boolean',
        :'simulcast_targets' => :'Array<SimulcastTarget>',
        :'test' => :'Boolean'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `MuxRuby::LiveStream` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `MuxRuby::LiveStream`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'stream_key')
        self.stream_key = attributes[:'stream_key']
      end

      if attributes.key?(:'active_asset_id')
        self.active_asset_id = attributes[:'active_asset_id']
      end

      if attributes.key?(:'recent_asset_ids')
        if (value = attributes[:'recent_asset_ids']).is_a?(Array)
          self.recent_asset_ids = value
        end
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'playback_ids')
        if (value = attributes[:'playback_ids']).is_a?(Array)
          self.playback_ids = value
        end
      end

      if attributes.key?(:'new_asset_settings')
        self.new_asset_settings = attributes[:'new_asset_settings']
      end

      if attributes.key?(:'passthrough')
        self.passthrough = attributes[:'passthrough']
      end

      if attributes.key?(:'reconnect_window')
        self.reconnect_window = attributes[:'reconnect_window']
      end

      if attributes.key?(:'reduced_latency')
        self.reduced_latency = attributes[:'reduced_latency']
      end

      if attributes.key?(:'simulcast_targets')
        if (value = attributes[:'simulcast_targets']).is_a?(Array)
          self.simulcast_targets = value
        end
      end

      if attributes.key?(:'test')
        self.test = attributes[:'test']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          created_at == o.created_at &&
          stream_key == o.stream_key &&
          active_asset_id == o.active_asset_id &&
          recent_asset_ids == o.recent_asset_ids &&
          status == o.status &&
          playback_ids == o.playback_ids &&
          new_asset_settings == o.new_asset_settings &&
          passthrough == o.passthrough &&
          reconnect_window == o.reconnect_window &&
          reduced_latency == o.reduced_latency &&
          simulcast_targets == o.simulcast_targets &&
          test == o.test
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, created_at, stream_key, active_asset_id, recent_asset_ids, status, playback_ids, new_asset_settings, passthrough, reconnect_window, reduced_latency, simulcast_targets, test].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = MuxRuby.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
