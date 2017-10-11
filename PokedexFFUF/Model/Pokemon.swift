//
//  Pokemon.swift
//  PokedexFFUF
//
//  Created by FFUF on 11/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import FSwiftParser
import IGListKit
import Rapid

fileprivate struct PokemonDecodable: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
}

public class Pokemon: JAObject {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    
    public required init(data: Data) throws {
        do{
            let pokemonDecodable = try JSONDecoder().decode(PokemonDecodable.self, from: data)
            
            self.id = pokemonDecodable.id
            self.name = pokemonDecodable.name
            self.height = pokemonDecodable.height
            self.weight = pokemonDecodable.weight
            
        }catch {
            fatalError(error.localizedDescription)
        }
    }
}

extension Pokemon: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
         return self
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Pokemon else { return false }
        
        return self.id == object.id && self.name == object.name && self.height == object.height && self.weight == object.weight
    }
    
    
}
