# MuxRuby::VideoViewsApi

All URIs are relative to *https://api.mux.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_video_view**](VideoViewsApi.md#get_video_view) | **GET** /data/v1/video-views/{VIDEO_VIEW_ID} | Get a Video View |
| [**list_video_views**](VideoViewsApi.md#list_video_views) | **GET** /data/v1/video-views | List Video Views |


## get_video_view

> <VideoViewResponse> get_video_view(video_view_id)

Get a Video View

Returns the details of a video view.

### Examples

```ruby
require 'time'
require 'mux_ruby'
# setup authorization
MuxRuby.configure do |config|
  # Configure HTTP basic authorization: accessToken
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = MuxRuby::VideoViewsApi.new
video_view_id = 'abcd1234' # String | ID of the Video View

begin
  # Get a Video View
  result = api_instance.get_video_view(video_view_id)
  p result
rescue MuxRuby::ApiError => e
  puts "Error when calling VideoViewsApi->get_video_view: #{e}"
end
```

#### Using the get_video_view_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VideoViewResponse>, Integer, Hash)> get_video_view_with_http_info(video_view_id)

```ruby
begin
  # Get a Video View
  data, status_code, headers = api_instance.get_video_view_with_http_info(video_view_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VideoViewResponse>
rescue MuxRuby::ApiError => e
  puts "Error when calling VideoViewsApi->get_video_view_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **video_view_id** | **String** | ID of the Video View |  |

### Return type

[**VideoViewResponse**](VideoViewResponse.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_video_views

> <ListVideoViewsResponse> list_video_views(opts)

List Video Views

Returns a list of video views.

### Examples

```ruby
require 'time'
require 'mux_ruby'
# setup authorization
MuxRuby.configure do |config|
  # Configure HTTP basic authorization: accessToken
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = MuxRuby::VideoViewsApi.new
opts = {
  limit: 56, # Integer | Number of items to include in the response
  page: 56, # Integer | Offset by this many pages, of the size of `limit`
  viewer_id: 'viewer_id_example', # String | Viewer ID to filter results by. This value may be provided by the integration, or may be created by Mux.
  error_id: 56, # Integer | Filter video views by the provided error ID (as returned in the error_type_id field in the list video views endpoint). If you provide any as the error ID, this will filter the results to those with any error.
  order_direction: 'asc', # String | Sort order.
  filters: ['inner_example'], # Array<String> | Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]=operating_system:windows&filters[]=country:US). Possible filter names are the same as returned by the List Filters endpoint. 
  timeframe: ['inner_example'] # Array<String> | Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]=). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]=1498867200&timeframe[]=1498953600   * duration string e.g. timeframe[]=24:hours or timeframe[]=7:days. 
}

begin
  # List Video Views
  result = api_instance.list_video_views(opts)
  p result
rescue MuxRuby::ApiError => e
  puts "Error when calling VideoViewsApi->list_video_views: #{e}"
end
```

#### Using the list_video_views_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListVideoViewsResponse>, Integer, Hash)> list_video_views_with_http_info(opts)

```ruby
begin
  # List Video Views
  data, status_code, headers = api_instance.list_video_views_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListVideoViewsResponse>
rescue MuxRuby::ApiError => e
  puts "Error when calling VideoViewsApi->list_video_views_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | Number of items to include in the response | [optional][default to 25] |
| **page** | **Integer** | Offset by this many pages, of the size of &#x60;limit&#x60; | [optional][default to 1] |
| **viewer_id** | **String** | Viewer ID to filter results by. This value may be provided by the integration, or may be created by Mux. | [optional] |
| **error_id** | **Integer** | Filter video views by the provided error ID (as returned in the error_type_id field in the list video views endpoint). If you provide any as the error ID, this will filter the results to those with any error. | [optional] |
| **order_direction** | **String** | Sort order. | [optional] |
| **filters** | [**Array&lt;String&gt;**](String.md) | Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]&#x3D;operating_system:windows&amp;filters[]&#x3D;country:US). Possible filter names are the same as returned by the List Filters endpoint.  | [optional] |
| **timeframe** | [**Array&lt;String&gt;**](String.md) | Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600   * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days.  | [optional] |

### Return type

[**ListVideoViewsResponse**](ListVideoViewsResponse.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

