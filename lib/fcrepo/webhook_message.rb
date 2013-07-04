module Fcrepo
  class WebhookMessage
    attr_accessor :message
    attr_accessor :namespaces
    
    # Fedora messages are Atom Entries
    def initialize message
      self.message = Nokogiri::XML(message)
      self.namespaces = {'a' => 'http://www.w3.org/2005/Atom'}
    end

    def identifier
      message.xpath("/a:entry/a:summary", namespaces).text
    end 

    def action
      message.xpath('/a:entry/a:title', namespaces).text
    end
    
    def repository_url
      message.xpath('/a:entry/a:title/@xml:base', namespaces).value
    end

  end
end