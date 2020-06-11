import React, { Component } from "react";
import ReactTable from "react-table";
import "react-table/react-table.css";
import axios from "axios";
class App extends Component {
  constructor(props) {
    super(props);
    //Initial data from API
    this.state = {
      data: []
    };
    let url = "http://localhost:3000/players"
    axios.get(url).then(res => {
      // Update react-table
      this.setState({
        data: res.data.data.map(p => (p.attributes)),
        pages: res.data.meta.pagination.total_pages,
        loading: false,
        csvUrl: "http://localhost:3000/players/download"
      });
    });
  }
  render() {
    const columns = [
      {
        Header: "Player",
        accessor: "name",
        sortable: false,
        filterable: true
      },
      {
        Header: "Team",
        accessor: "team",
        sortable: false,
        filterable: false
      },
      {
        Header: "Pos",
        accessor: "position",
        sortable: false,
        filterable: false
      },
      {
        Header: "Att",
        accessor: "attempts",
        sortable: false,
        filterable: false
      },
      {
        Header: "Att/G",
        accessor: "attempts_per_game_average",
        sortable: false,
        filterable: false
      },
      {
        Header: "Yds",
        accessor: "total_yards",
        sortable: true,
        filterable: false
      },
      {
        Header: "Avg",
        accessor: "average_yards_per_attempt",
        sortable: false,
        filterable: false
      },
      {
        Header: "Yds/G",
        accessor: "yards_per_game",
        sortable: false,
        filterable: false
      },
      {
        Header: "TD",
        accessor: "total_touchdowns",
        sortable: true,
        filterable: false
      },
      {
        Header: "Lng",
        accessor: "longest_rush",
        sortable: true,
        filterable: false
      },
      {
        Header: "1st",
        accessor: "first_down",
        sortable: false,
        filterable: false
      },
      {
        Header: "1st%",
        accessor: "first_down_pct",
        sortable: false,
        filterable: false
      },
      {
        Header: "20+",
        accessor: "twenty_yards_each",
        sortable: false,
        filterable: false
      },
      {
        Header: "40+",
        accessor: "fourty_yards_each",
        sortable: false,
        filterable: false
      },
      {
        Header: "FUM",
        accessor: "fumbles",
        sortable: false,
        filterable: false
      }
    ];
    return (
      <div>
        <h2>
          <span>Players</span>
          <a id="DownloadLink" style={{float: "right"}} href={this.state.pages > 0 ? this.state.csvUrl : '#'} >Export CSV</a>
        </h2>
        <ReactTable
          columns={columns}
          data={this.state.data}
          pages={this.state.pages}
          loading={this.state.loading}
          onFetchData={(state, instance) => {
            let queryString = ""
            queryString = queryString + "page=" + (state.page + 1)
            queryString = queryString + "&per_page=" + (state.pageSize)
            if (state.sorted.length > 0) {
              let sort =  (state.sorted[0].desc ? '-' : '+') + state.sorted[0].id
              queryString = queryString + "&sort=" + sort
            }
            if (state.filtered.length > 0) {
              let search =  state.filtered[0].value
              queryString = queryString + "&search=" + search
            }
            axios.get("http://localhost:3000/players?" + queryString).then(res => {
              // Update react-table
              // let csvUrl = res.data.meta.pagination.total_pages > 0 ? "http://localhost:3000/players/download?" + queryString : ''
              // document.getElementById("DownloadLink").disabled = true
              this.setState({
                data: res.data.data.map(p => (p.attributes)),
                pages: res.data.meta.pagination.total_pages,
                loading: false,
                csvUrl: "http://localhost:3000/players/download?" + queryString
              });
            });
          }}
          noDataText={"Loading..."}
          manual // informs React Table that you'll be handling sorting and pagination server-side
        />
      </div>
    );
  }
}

export default App;
