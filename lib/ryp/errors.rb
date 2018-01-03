module Ryp
  class RypError < StandardError; end
  class UnknownContentType < RypError; end
  class UnknownNetwork < RypError; end
  class BadResponseError < RypError; end
end
