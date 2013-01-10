module Magento
  class Error
    UNKNOWN               = 0
    INTERNAL              = 1
    ACCESS_DENIED         = 2
    INVALID_API_PATH      = 3
    RESOURCE_NOT_CALLABLE = 4

    MESSAGES = [
      'Unknown Error',
      'Internal Error. Please see log for details',
      'Access Denied',
      'Invalid API Path',
      'Resource path is not callable'
    ]
  end
end
