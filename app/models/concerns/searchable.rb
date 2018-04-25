module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    index_name "dishes"
    mapping do
      indexes :id, type: 'integer', index: true
      indexes :name, type: 'text', index: true, boost: 3, fielddata: true
      indexes :subtitle, type: 'text', index: true, boost: 3, fielddata: true
      indexes :description, type: 'text', index: true, boost: 2, fielddata: true, analyzer: 'job_analyzer'
      indexes :tags, type: 'text', index: true, fielddata: true
    end

    def self.search_el(page, limit, location, tags = [], keyword_match = nil)
      page = page.to_i
      from = (page > 0 ? page - 1 : page) * limit
      search_definition = create_query(from, limit, location, tags, keyword_match)
      res = search_elasticsearch(search_definition)
      res[:from] = from
      res
    end

    def self.search_elasticsearch(search_definition)
      response = __elasticsearch__.search(search_definition)
      hits = response.to_a
      jobs_ids = []
      hits.each do |elm|
        jobs_ids.push(elm.id)
      end
      body = if jobs_ids.present?
       Dish.where(id: jobs_ids)
     else
       []
     end
     {
      body: body,
      total: response.results.total
    }
  rescue => e
    Rails.logger.error(e)
    {
      body: [],
      total: 0
    }
  end

  def self.create_query(from, size, location, tags = [], keyword_match = nil)
    view_count_filter ={
     filter: {
      range: {
        view_count: {
          from: 0
        }
      }
      }, 
      script_score: {
        script: "_score + Math.log(doc.view_count.value)"
      }
    }

    {
      from: from,
      size: size,
      query: {
        function_score: {
          query: {
            multi_match: {
              query: keyword_match,
              fields: [ "name", "display_name", "subtitle", "description" ]
            } 
            },
            functions: [
              ],
            }
          }
        }
      end
    end
end