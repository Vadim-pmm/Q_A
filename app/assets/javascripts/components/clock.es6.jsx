class Clock extends React.Component {
    constructor(props) {
        // передается строка со значением времени начала сессии
        super();
        this.session_started = Date.parse(props.session_);
        this.state = {
            minutes: 0,
            seconds: 0
        };
    }

    calculateTime() {
        // session is going to last 20 min
        const time_left = (20*60000) - (Date.parse(new Date()) - this.session_started);
        if (time_left > 0) {
            const min_left = Math.floor(time_left / 60000);
            const sec_left = Math.floor(time_left / 1000) % 60;
            this.setState({minutes: min_left, seconds: sec_left})
        }
    }

    componentDidMount() {
        setInterval(() => this.calculateTime(), 1000)
    }

    render() {
        return (<div>
                  <div className='clock'>time left: {this.state.minutes} min </div>
                  <div className='clock'>{this.state.seconds} s</div>
                </div>);
    }
}