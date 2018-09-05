import React, { Component } from 'react'
import GroupsIndexContainer from '../containers/GroupsIndexContainer'

class GroupShowContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      name: '',
      description: '',
      ownerId: null,
      ownerName: '',
      currentUserId: null,
      membersWithArmies: [],
      memberIds: [],
    }
  }

  componentDidMount() {
    fetch(`/api/v1/groups/${this.props.params.id}`, {
      credentials: 'same-origin'
    })
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
        this.setState({
          name: body.group.name,
          description: body.group.description,
          ownerId: body.group.owner_id,
          ownerName: body.owner[0].username,
          currentUserId: body.current_user.id,
          membersWithArmies: body.members_with_armies,
          memberIds: body.member_Ids,
          memberships: body.memberships
        })
      })
    .catch(error => console.error(`Fetch error: ${error.message}`));
  }

  render() {
    let editGroupLink = ''
    if (this.state.currentUserId === this.state.ownerId) {
      editGroupLink = <div><a href={`/groups/${this.props.params.id}/edit`}>Edit this group</a></div>
    }

    let joinGroupLink = ''
    if (!this.state.memberIds.includes(this.state.currentUserId)) {
      joinGroupLink = <div><a href={`/groups/${this.props.params.id}/memberships/new`}>Join this group</a></div>
    }

    return (
      <div>
        <h2>{this.state.name}</h2>
        Description: {this.state.description}<br/>
        Group creator: {this.state.ownerName}<br/>
        Members:<br/>
        {this.state.membersWithArmies.join(",\n")}
        {editGroupLink}
        {joinGroupLink}
      </div>
    )
  }
}

export default GroupShowContainer
