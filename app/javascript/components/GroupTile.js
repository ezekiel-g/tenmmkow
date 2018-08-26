import React, { Component } from 'react'
import { Link } from 'react-router'

class GroupTile extends Component {
  constructor(props) {
    super(props)
    this.state = {

    }
  }

  render() {

    return (
      <div>
        <Link to={`/groups/${this.props.id}`}>{this.props.name}</Link>
      </div>
    )
  }

}

export default GroupTile
