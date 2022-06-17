import React, { Component } from 'react'
import axios from "axios";
export default class Test extends Component {
    state={
        jobs:[]
    }
    componentDidMount(){   
        this.getJobs();
    }
    getJobs(){
        axios.get("http://localhost:3000/api/v1/sample_jobs")
      .then(res => {
        console.log(res.data)
        this.setState({jobs: res.data})});
    }
  render() {

    return (
        <div>
        {this.state.jobs.map(job=>
            <div>
                <h1>{job.title}</h1>
            </div>
        )}
        </div>
    )
  }
}
