\(person : ./Person.dhall)

->  ''
    <li class="list-group-item">
      <span class="badge">${Integer/show person.upvotes}</span>
      ${person.name}
    </li>
    ''
