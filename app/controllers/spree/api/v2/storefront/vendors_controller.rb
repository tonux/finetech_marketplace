module Spree
    module Api
      module V2
        module Storefront
          class VendorsController < ::Spree::Api::V2::BaseController
            def show
                puts " ======> show vendor"
              render_serialized_payload { serialize_resource(resource) }
            end
  
           private
           
           def serialize_resource(resource)
              Spree::Api::V2::Storefront::VendorSerializer.new(
                 resource,
                 include: resource_includes,
                 sparse_fields: sparse_fields
               ).serializable_hash
            end
  
            def resource
              Spree::Vendor.find(params[:id])
            end
          end
        end
      end
    end
  end