import React, { Component } from 'react'
import GroupsIndexContainer from '../containers/GroupsIndexContainer'

class GroupShowContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      name: '',
      description: '',
      ownerId: null
    }
  }

  componentDidMount(){
    fetch(`/api/v1/groups/${this.props.params.id}`)
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
          name: body.name,
          description: body.description,
          ownerId: body.owner_id
        })
      })
    .catch(error => console.error(`Fetch error: ${error.message}`));
  }

  render() {

    return(
      <div>
        <h2>{this.state.name}</h2>
        {this.state.description}
        GROUP CREATOR: {this.state.ownerId}
      </div>
    )
  }
}

export default GroupShowContainer
