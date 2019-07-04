require 'spec_helper'
require_relative 'support/auth'

describe 'Characters Endpoint' do
  describe 'When I am an api user' do
    before(:each) do
      @auth_param = Auth.gen_auth_params
    end
    it 'list five characters' do
      get "characters?limit=5&#{@auth_param}"

      expect_status(200)
      expect_json_sizes('data.results', 5)
      expect_json_types('data.results.*',
                        id: :integer,
                        name: :string,
                        description: :string,
                        thumbnail: :object,
                        resourceURI: :string,
                        comics: :object,
                        series: :object,
                        stories: :object,
                        events: :object,
                        urls: :array)
    end

    it 'list information about specific character' do
      get "characters/#{ENV['CHARACTER_ID']}?#{@auth_param}"

      expect_status(200)
      expect_json_sizes('data.results', 1)
      expect_json_types('data.results.*',
                        id: :integer,
                        name: :string,
                        description: :string,
                        thumbnail: :object,
                        resourceURI: :string,
                        comics: :object,
                        series: :object,
                        stories: :object,
                        events: :object,
                        urls: :array)
      expect_json('data.results.*',
                  id: ENV['CHARACTER_ID'].to_i,
                  name: ENV['CHARACTER_NAME'])
    end

    it 'list comics about specific character' do
      get "characters/#{ENV['CHARACTER_ID']}/comics?#{@auth_param}"
      expect_status(200)
      expect_json_types('data.results.*',
                        id: :integer,
                        digitalId: :integer,
                        title: :string,
                        issueNumber: :integer,
                        variantDescription: :string,
                        modified: :string,
                        isbn: :string,
                        upc: :string,
                        diamondCode: :string,
                        ean: :string,
                        issn: :string,
                        format: :string,
                        pageCount: :integer,
                        textObjects: :array_of_objects,
                        resourceURI: :string,
                        urls: :array_of_objects,
                        series: :object,
                        variants: :array,
                        collections: :array,
                        collectedIssues: :array,
                        dates: :array_of_objects,
                        prices: :array_of_objects,
                        thumbnail: :object,
                        images: :array_of_objects,
                        creators: :object,
                        characters: :object,
                        stories: :object,
                        events: :object)
    end
  end
end
