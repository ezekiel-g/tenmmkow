import React, { Component } from 'react'
import GroupTile from '../components/GroupTile.js'

class GroupsIndexContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      groups: []
    }
  }

  componentDidMount(){
    fetch('/api/v1/groups')
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
         error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
        this.setState({ groups: body })
      })
    .catch(error => console.error(`Fetch error: ${error.message}`));
  }

  render() {
    let groups = this.state.groups.map((group) => {
      return (
        <GroupTile
          key={group.id}
          id={group.id}
          name={group.name}
          description={group.description}
          ownerId={group.owner_id}
        />
      )
    })
    return(
      <div>
        <h2>GROUPS</h2>
        {groups}
      </div>
    )
  }
}

export default GroupsIndexContainer
