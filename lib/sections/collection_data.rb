module Audit
  class CollectionData

    def self.add(character, data)
      character.data['achievement_points'] =
        data['achievementPoints']

      character.data['mounts'] =
        data['statistics']['subCategories'][0]['subCategories'][2]['statistics'][7]['quantity']

      pets_owned = []
      level_25_pets = 0

      data['pets']['collected'].each do |pet|
        unless pets_owned.include?(pet['stats']['speciesId'])
          pets_owned << pet['stats']['speciesId']
          level_25_pets += pet['stats']['level'] == 25 ? 1 : 0
        end
      end

      character.data['unique_pets'] =
        data['achievements']['criteriaQuantity'][data['achievements']['criteria'].index(19598)]
      character.data['lvl_25_pets'] = level_25_pets
    end
  end
end
