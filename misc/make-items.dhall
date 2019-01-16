    -- You can also import any type or expression by its URL
    let List/map = https://ipfs.io/ipfs/QmQ8w5PLcsNz56dMvRtq54vbuPe9cNnCCUXAQp6xLc6Ccx/Prelude/List/map
in  let Text/concat = https://ipfs.io/ipfs/QmRHdo2Jg59EZUT8Toq7MCZFN6e7wNbBtvaF7HCTrDFPxG/Prelude/Text/concat
in  \(people : List ./Person.dhall)
->   Text/concat (List/map ./Person Text ./make-item people)


