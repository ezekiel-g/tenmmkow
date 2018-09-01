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
      currentUserId: null
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
          currentUserId: body.current_user.id
        })
      })
    .catch(error => console.error(`Fetch error: ${error.message}`));
  }

  render() {
    let editGroupLink = ''
    if (this.state.currentUserId === this.state.ownerId) {
      editGroupLink = <div><a href={`/groups/${this.props.params.id}/edit`}>EDIT THIS GROUP</a></div>
    }

    return(
      <div>
        <h2>{this.state.name}</h2>
        {this.state.description}
        GROUP CREATOR: {this.state.ownerName}
        {editGroupLink}
      </div>
    )
  }
}

export default GroupShowContainer
