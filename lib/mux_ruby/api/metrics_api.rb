=begin
#Mux API

#Mux is how developers build online video. This API encompasses both Mux Video and Mux Data functionality to help you build your video-related projects better and faster than ever before.

The version of the OpenAPI document: v1
Contact: devex@mux.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.1

=end

require 'cgi'

module MuxRuby
  class MetricsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get metric timeseries data
    # Returns timeseries data for a specific metric.
    # @param metric_id [String] ID of the Metric
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600   * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @option opts [Array<String>] :filters Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]&#x3D;operating_system:windows&amp;filters[]&#x3D;country:US). Possible filter names are the same as returned by the List Filters endpoint. 
    # @option opts [String] :measurement Measurement for the provided metric. If omitted, the default for the metric will be used.
    # @option opts [String] :order_direction Sort order.
    # @option opts [String] :group_by Time granularity to group results by. If this value is omitted, a default granularity is chosen based on the supplied timeframe.
    # @return [GetMetricTimeseriesDataResponse]
    def get_metric_timeseries_data(metric_id, opts = {})
      data, _status_code, _headers = get_metric_timeseries_data_with_http_info(metric_id, opts)
      data
    end

    # Get metric timeseries data
    # Returns timeseries data for a specific metric.
    # @param metric_id [String] ID of the Metric
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600   * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @option opts [Array<String>] :filters Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]&#x3D;operating_system:windows&amp;filters[]&#x3D;country:US). Possible filter names are the same as returned by the List Filters endpoint. 
    # @option opts [String] :measurement Measurement for the provided metric. If omitted, the default for the metric will be used.
    # @option opts [String] :order_direction Sort order.
    # @option opts [String] :group_by Time granularity to group results by. If this value is omitted, a default granularity is chosen based on the supplied timeframe.
    # @return [Array<(GetMetricTimeseriesDataResponse, Integer, Hash)>] GetMetricTimeseriesDataResponse data, response status code and response headers
    def get_metric_timeseries_data_with_http_info(metric_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MetricsApi.get_metric_timeseries_data ...'
      end
      # verify the required parameter 'metric_id' is set
      if @api_client.config.client_side_validation && metric_id.nil?
        fail ArgumentError, "Missing the required parameter 'metric_id' when calling MetricsApi.get_metric_timeseries_data"
      end
      # verify enum value
      allowable_values = ["aggregate_startup_time", "downscale_percentage", "exits_before_video_start", "max_downscale_percentage", "max_upscale_percentage", "page_load_time", "playback_failure_percentage", "playback_failure_score", "player_startup_time", "playing_time", "rebuffer_count", "rebuffer_duration", "rebuffer_frequency", "rebuffer_percentage", "rebuffer_score", "requests_for_first_preroll", "seek_latency", "startup_time_score", "unique_viewers", "upscale_percentage", "video_quality_score", "video_startup_preroll_load_time", "video_startup_preroll_request_time", "video_startup_time", "viewer_experience_score", "views", "weighted_average_bitrate"]
      if @api_client.config.client_side_validation && !allowable_values.include?(metric_id)
        fail ArgumentError, "invalid value for \"metric_id\", must be one of #{allowable_values}"
      end
      allowable_values = ["95th", "median", "avg", "count", "sum"]
      if @api_client.config.client_side_validation && opts[:'measurement'] && !allowable_values.include?(opts[:'measurement'])
        fail ArgumentError, "invalid value for \"measurement\", must be one of #{allowable_values}"
      end
      allowable_values = ["asc", "desc"]
      if @api_client.config.client_side_validation && opts[:'order_direction'] && !allowable_values.include?(opts[:'order_direction'])
        fail ArgumentError, "invalid value for \"order_direction\", must be one of #{allowable_values}"
      end
      allowable_values = ["hour", "day"]
      if @api_client.config.client_side_validation && opts[:'group_by'] && !allowable_values.include?(opts[:'group_by'])
        fail ArgumentError, "invalid value for \"group_by\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/data/v1/metrics/{METRIC_ID}/timeseries'.sub('{' + 'METRIC_ID' + '}', CGI.escape(metric_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'timeframe[]'] = @api_client.build_collection_param(opts[:'timeframe'], :multi) if !opts[:'timeframe'].nil?
      query_params[:'filters[]'] = @api_client.build_collection_param(opts[:'filters'], :multi) if !opts[:'filters'].nil?
      query_params[:'measurement'] = opts[:'measurement'] if !opts[:'measurement'].nil?
      query_params[:'order_direction'] = opts[:'order_direction'] if !opts[:'order_direction'].nil?
      query_params[:'group_by'] = opts[:'group_by'] if !opts[:'group_by'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetMetricTimeseriesDataResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['accessToken']

      new_options = opts.merge(
        :operation => :"MetricsApi.get_metric_timeseries_data",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MetricsApi#get_metric_timeseries_data\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Overall values
    # Returns the overall value for a specific metric, as well as the total view count, watch time, and the Mux Global metric value for the metric.
    # @param metric_id [String] ID of the Metric
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600   * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @option opts [Array<String>] :filters Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]&#x3D;operating_system:windows&amp;filters[]&#x3D;country:US). Possible filter names are the same as returned by the List Filters endpoint. 
    # @option opts [String] :measurement Measurement for the provided metric. If omitted, the default for the metric will be used.
    # @return [GetOverallValuesResponse]
    def get_overall_values(metric_id, opts = {})
      data, _status_code, _headers = get_overall_values_with_http_info(metric_id, opts)
      data
    end

    # Get Overall values
    # Returns the overall value for a specific metric, as well as the total view count, watch time, and the Mux Global metric value for the metric.
    # @param metric_id [String] ID of the Metric
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600   * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @option opts [Array<String>] :filters Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]&#x3D;operating_system:windows&amp;filters[]&#x3D;country:US). Possible filter names are the same as returned by the List Filters endpoint. 
    # @option opts [String] :measurement Measurement for the provided metric. If omitted, the default for the metric will be used.
    # @return [Array<(GetOverallValuesResponse, Integer, Hash)>] GetOverallValuesResponse data, response status code and response headers
    def get_overall_values_with_http_info(metric_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MetricsApi.get_overall_values ...'
      end
      # verify the required parameter 'metric_id' is set
      if @api_client.config.client_side_validation && metric_id.nil?
        fail ArgumentError, "Missing the required parameter 'metric_id' when calling MetricsApi.get_overall_values"
      end
      # verify enum value
      allowable_values = ["aggregate_startup_time", "downscale_percentage", "exits_before_video_start", "max_downscale_percentage", "max_upscale_percentage", "page_load_time", "playback_failure_percentage", "playback_failure_score", "player_startup_time", "playing_time", "rebuffer_count", "rebuffer_duration", "rebuffer_frequency", "rebuffer_percentage", "rebuffer_score", "requests_for_first_preroll", "seek_latency", "startup_time_score", "unique_viewers", "upscale_percentage", "video_quality_score", "video_startup_preroll_load_time", "video_startup_preroll_request_time", "video_startup_time", "viewer_experience_score", "views", "weighted_average_bitrate"]
      if @api_client.config.client_side_validation && !allowable_values.include?(metric_id)
        fail ArgumentError, "invalid value for \"metric_id\", must be one of #{allowable_values}"
      end
      allowable_values = ["95th", "median", "avg", "count", "sum"]
      if @api_client.config.client_side_validation && opts[:'measurement'] && !allowable_values.include?(opts[:'measurement'])
        fail ArgumentError, "invalid value for \"measurement\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/data/v1/metrics/{METRIC_ID}/overall'.sub('{' + 'METRIC_ID' + '}', CGI.escape(metric_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'timeframe[]'] = @api_client.build_collection_param(opts[:'timeframe'], :multi) if !opts[:'timeframe'].nil?
      query_params[:'filters[]'] = @api_client.build_collection_param(opts[:'filters'], :multi) if !opts[:'filters'].nil?
      query_params[:'measurement'] = opts[:'measurement'] if !opts[:'measurement'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetOverallValuesResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['accessToken']

      new_options = opts.merge(
        :operation => :"MetricsApi.get_overall_values",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MetricsApi#get_overall_values\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List all metric values
    # List all of the values across every breakdown for a specific metric.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600   * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @option opts [Array<String>] :filters Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]&#x3D;operating_system:windows&amp;filters[]&#x3D;country:US). Possible filter names are the same as returned by the List Filters endpoint. 
    # @option opts [String] :dimension Dimension the specified value belongs to
    # @option opts [String] :value Value to show all available metrics for
    # @return [ListAllMetricValuesResponse]
    def list_all_metric_values(opts = {})
      data, _status_code, _headers = list_all_metric_values_with_http_info(opts)
      data
    end

    # List all metric values
    # List all of the values across every breakdown for a specific metric.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600   * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @option opts [Array<String>] :filters Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]&#x3D;operating_system:windows&amp;filters[]&#x3D;country:US). Possible filter names are the same as returned by the List Filters endpoint. 
    # @option opts [String] :dimension Dimension the specified value belongs to
    # @option opts [String] :value Value to show all available metrics for
    # @return [Array<(ListAllMetricValuesResponse, Integer, Hash)>] ListAllMetricValuesResponse data, response status code and response headers
    def list_all_metric_values_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MetricsApi.list_all_metric_values ...'
      end
      allowable_values = ["asn", "browser", "browser_version", "cdn", "continent_code", "country", "exit_before_video_start", "experiment_name", "operating_system", "operating_system_version", "player_autoplay", "player_error_code", "player_mux_plugin_name", "player_mux_plugin_version", "player_name", "player_preload", "player_remote_played", "player_software", "player_software_version", "player_version", "preroll_ad_asset_hostname", "preroll_ad_tag_hostname", "preroll_played", "preroll_requested", "region", "source_hostname", "source_type", "stream_type", "sub_property_id", "video_encoding_variant", "video_id", "video_series", "video_title", "view_session_id", "viewer_connection_type", "viewer_device_category", "viewer_device_manufacturer", "viewer_device_model", "viewer_device_name", "viewer_user_id"]
      if @api_client.config.client_side_validation && opts[:'dimension'] && !allowable_values.include?(opts[:'dimension'])
        fail ArgumentError, "invalid value for \"dimension\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/data/v1/metrics/comparison'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'timeframe[]'] = @api_client.build_collection_param(opts[:'timeframe'], :multi) if !opts[:'timeframe'].nil?
      query_params[:'filters[]'] = @api_client.build_collection_param(opts[:'filters'], :multi) if !opts[:'filters'].nil?
      query_params[:'dimension'] = opts[:'dimension'] if !opts[:'dimension'].nil?
      query_params[:'value'] = opts[:'value'] if !opts[:'value'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListAllMetricValuesResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['accessToken']

      new_options = opts.merge(
        :operation => :"MetricsApi.list_all_metric_values",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MetricsApi#list_all_metric_values\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List breakdown values
    # List the breakdown values for a specific metric.
    # @param metric_id [String] ID of the Metric
    # @param [Hash] opts the optional parameters
    # @option opts [String] :group_by Breakdown value to group the results by
    # @option opts [String] :measurement Measurement for the provided metric. If omitted, the default for the metric will be used.
    # @option opts [Array<String>] :filters Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]&#x3D;operating_system:windows&amp;filters[]&#x3D;country:US). Possible filter names are the same as returned by the List Filters endpoint. 
    # @option opts [Integer] :limit Number of items to include in the response (default to 25)
    # @option opts [Integer] :page Offset by this many pages, of the size of &#x60;limit&#x60; (default to 1)
    # @option opts [String] :order_by Value to order the results by
    # @option opts [String] :order_direction Sort order.
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600   * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @return [ListBreakdownValuesResponse]
    def list_breakdown_values(metric_id, opts = {})
      data, _status_code, _headers = list_breakdown_values_with_http_info(metric_id, opts)
      data
    end

    # List breakdown values
    # List the breakdown values for a specific metric.
    # @param metric_id [String] ID of the Metric
    # @param [Hash] opts the optional parameters
    # @option opts [String] :group_by Breakdown value to group the results by
    # @option opts [String] :measurement Measurement for the provided metric. If omitted, the default for the metric will be used.
    # @option opts [Array<String>] :filters Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]&#x3D;operating_system:windows&amp;filters[]&#x3D;country:US). Possible filter names are the same as returned by the List Filters endpoint. 
    # @option opts [Integer] :limit Number of items to include in the response
    # @option opts [Integer] :page Offset by this many pages, of the size of &#x60;limit&#x60;
    # @option opts [String] :order_by Value to order the results by
    # @option opts [String] :order_direction Sort order.
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600   * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @return [Array<(ListBreakdownValuesResponse, Integer, Hash)>] ListBreakdownValuesResponse data, response status code and response headers
    def list_breakdown_values_with_http_info(metric_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MetricsApi.list_breakdown_values ...'
      end
      # verify the required parameter 'metric_id' is set
      if @api_client.config.client_side_validation && metric_id.nil?
        fail ArgumentError, "Missing the required parameter 'metric_id' when calling MetricsApi.list_breakdown_values"
      end
      # verify enum value
      allowable_values = ["aggregate_startup_time", "downscale_percentage", "exits_before_video_start", "max_downscale_percentage", "max_upscale_percentage", "page_load_time", "playback_failure_percentage", "playback_failure_score", "player_startup_time", "playing_time", "rebuffer_count", "rebuffer_duration", "rebuffer_frequency", "rebuffer_percentage", "rebuffer_score", "requests_for_first_preroll", "seek_latency", "startup_time_score", "unique_viewers", "upscale_percentage", "video_quality_score", "video_startup_preroll_load_time", "video_startup_preroll_request_time", "video_startup_time", "viewer_experience_score", "views", "weighted_average_bitrate"]
      if @api_client.config.client_side_validation && !allowable_values.include?(metric_id)
        fail ArgumentError, "invalid value for \"metric_id\", must be one of #{allowable_values}"
      end
      allowable_values = ["asn", "browser", "browser_version", "cdn", "continent_code", "country", "exit_before_video_start", "experiment_name", "operating_system", "operating_system_version", "player_autoplay", "player_error_code", "player_mux_plugin_name", "player_mux_plugin_version", "player_name", "player_preload", "player_remote_played", "player_software", "player_software_version", "player_version", "preroll_ad_asset_hostname", "preroll_ad_tag_hostname", "preroll_played", "preroll_requested", "region", "source_hostname", "source_type", "stream_type", "sub_property_id", "video_encoding_variant", "video_id", "video_series", "video_title", "view_session_id", "viewer_connection_type", "viewer_device_category", "viewer_device_manufacturer", "viewer_device_model", "viewer_device_name", "viewer_user_id"]
      if @api_client.config.client_side_validation && opts[:'group_by'] && !allowable_values.include?(opts[:'group_by'])
        fail ArgumentError, "invalid value for \"group_by\", must be one of #{allowable_values}"
      end
      allowable_values = ["95th", "median", "avg", "count", "sum"]
      if @api_client.config.client_side_validation && opts[:'measurement'] && !allowable_values.include?(opts[:'measurement'])
        fail ArgumentError, "invalid value for \"measurement\", must be one of #{allowable_values}"
      end
      allowable_values = ["negative_impact", "value", "views", "field"]
      if @api_client.config.client_side_validation && opts[:'order_by'] && !allowable_values.include?(opts[:'order_by'])
        fail ArgumentError, "invalid value for \"order_by\", must be one of #{allowable_values}"
      end
      allowable_values = ["asc", "desc"]
      if @api_client.config.client_side_validation && opts[:'order_direction'] && !allowable_values.include?(opts[:'order_direction'])
        fail ArgumentError, "invalid value for \"order_direction\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/data/v1/metrics/{METRIC_ID}/breakdown'.sub('{' + 'METRIC_ID' + '}', CGI.escape(metric_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'group_by'] = opts[:'group_by'] if !opts[:'group_by'].nil?
      query_params[:'measurement'] = opts[:'measurement'] if !opts[:'measurement'].nil?
      query_params[:'filters[]'] = @api_client.build_collection_param(opts[:'filters'], :multi) if !opts[:'filters'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'order_by'] = opts[:'order_by'] if !opts[:'order_by'].nil?
      query_params[:'order_direction'] = opts[:'order_direction'] if !opts[:'order_direction'].nil?
      query_params[:'timeframe[]'] = @api_client.build_collection_param(opts[:'timeframe'], :multi) if !opts[:'timeframe'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListBreakdownValuesResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['accessToken']

      new_options = opts.merge(
        :operation => :"MetricsApi.list_breakdown_values",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MetricsApi#list_breakdown_values\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Insights
    # Returns a list of insights for a metric. These are the worst performing values across all breakdowns sorted by how much they negatively impact a specific metric.
    # @param metric_id [String] ID of the Metric
    # @param [Hash] opts the optional parameters
    # @option opts [String] :measurement Measurement for the provided metric. If omitted, the default for the metric will be used.
    # @option opts [String] :order_direction Sort order.
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600   * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @return [ListInsightsResponse]
    def list_insights(metric_id, opts = {})
      data, _status_code, _headers = list_insights_with_http_info(metric_id, opts)
      data
    end

    # List Insights
    # Returns a list of insights for a metric. These are the worst performing values across all breakdowns sorted by how much they negatively impact a specific metric.
    # @param metric_id [String] ID of the Metric
    # @param [Hash] opts the optional parameters
    # @option opts [String] :measurement Measurement for the provided metric. If omitted, the default for the metric will be used.
    # @option opts [String] :order_direction Sort order.
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600   * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @return [Array<(ListInsightsResponse, Integer, Hash)>] ListInsightsResponse data, response status code and response headers
    def list_insights_with_http_info(metric_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MetricsApi.list_insights ...'
      end
      # verify the required parameter 'metric_id' is set
      if @api_client.config.client_side_validation && metric_id.nil?
        fail ArgumentError, "Missing the required parameter 'metric_id' when calling MetricsApi.list_insights"
      end
      # verify enum value
      allowable_values = ["aggregate_startup_time", "downscale_percentage", "exits_before_video_start", "max_downscale_percentage", "max_upscale_percentage", "page_load_time", "playback_failure_percentage", "playback_failure_score", "player_startup_time", "playing_time", "rebuffer_count", "rebuffer_duration", "rebuffer_frequency", "rebuffer_percentage", "rebuffer_score", "requests_for_first_preroll", "seek_latency", "startup_time_score", "unique_viewers", "upscale_percentage", "video_quality_score", "video_startup_preroll_load_time", "video_startup_preroll_request_time", "video_startup_time", "viewer_experience_score", "views", "weighted_average_bitrate"]
      if @api_client.config.client_side_validation && !allowable_values.include?(metric_id)
        fail ArgumentError, "invalid value for \"metric_id\", must be one of #{allowable_values}"
      end
      allowable_values = ["95th", "median", "avg", "count", "sum"]
      if @api_client.config.client_side_validation && opts[:'measurement'] && !allowable_values.include?(opts[:'measurement'])
        fail ArgumentError, "invalid value for \"measurement\", must be one of #{allowable_values}"
      end
      allowable_values = ["asc", "desc"]
      if @api_client.config.client_side_validation && opts[:'order_direction'] && !allowable_values.include?(opts[:'order_direction'])
        fail ArgumentError, "invalid value for \"order_direction\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/data/v1/metrics/{METRIC_ID}/insights'.sub('{' + 'METRIC_ID' + '}', CGI.escape(metric_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'measurement'] = opts[:'measurement'] if !opts[:'measurement'].nil?
      query_params[:'order_direction'] = opts[:'order_direction'] if !opts[:'order_direction'].nil?
      query_params[:'timeframe[]'] = @api_client.build_collection_param(opts[:'timeframe'], :multi) if !opts[:'timeframe'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListInsightsResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['accessToken']

      new_options = opts.merge(
        :operation => :"MetricsApi.list_insights",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MetricsApi#list_insights\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
