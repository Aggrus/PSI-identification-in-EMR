//ConvNetJS
//references: https://cs.stanford.edu/people/karpathy/convnetjs/docs.html

<script>

var output_div2 = document.getElementById("output2");
var input_div2 = document.getElementById("input2");
var count_div2 = document.getElementById("count2");
var probability_div2 = document.getElementById("probability2");

var testNetwork2 = function(x){
    var vf = x.vf.value;
    var bp1 = x.bp1.value;
    var bp2 = x.bp2.value;
    var hr = x.hr.value;
    var ptsd = x.ptsd.value;
    var activity = x.activity.value;
    var high_bp = ((ptsd == 1 && (bp1 > 180 || bp2 > 120)) || (ptsd == 0 && (bp1 > 160 || bp2 > 100)))? 1 : 0;
    var high_hr = (hr > 90)? 1 : 0;
    var temp = activity/100;
    var nn_in = {data:[ vf , temp , high_bp , high_hr , ptsd ]};
    // console.log(nn_in.data);
    var z = new convnetjs.Vol(nn_in.data);
    var trainer = new convnetjs.Trainer(net, {learning_rate:0, l2_decay:0});
    trainer.train(z, 1);
    var probability_volume2 = net.forward(z,1);
    var it_is = (parseFloat(probability_volume2.w[1]).toFixed(2) * 100);
    // console.log("it is:",it_is);
    var condition = (it_is >= .5)? "high anxiety" : "normal";
    var data_input_display = JSON.stringify({ vocal_evaluation_of_ptsd: vf, activity:activity, bp:bp1+"/"+bp2, hr: hr , ptsd_diagnosis:x.ptsd.value });

    input_div2.innerHTML = data_input_display;

    output_div2.innerHTML = condition;

}
var generateAnxietyDataPoint2 = function(){
    //blood pressure, heart rate,
    //140 / 90 and up is high, and below is low,
    //40 - 200 / 40 - 120
    var ptsd = ( Math.random() > .49)? 1:0;

    var activity = Math.floor(Math.random() * 100);

    var vf = ( Math.random() > .49)? 1:0;

    var bp1 = Math.floor((Math.random() * 140) + 60);

    var bp2 = Math.floor((Math.random() * 80) + 40);

    var high_bp = ((ptsd == 1 && (bp1 > 180 || bp2 > 120)) || (ptsd == 0 && (bp1 > 160 || bp2 > 100)))? 1 : 0;

    var hr = Math.floor((Math.random() * 135) + 45);

    var high_hr = (hr > 90)? 1 : 0;

    var output = (high_hr == 1 && high_bp == 1)? "High Anxiety" : "Low Anxiety Level";

    var true_false = (ptsd === 1)? "True" : "False"

    var inputs = "Blood_Pressure: " + bp1+"/"+bp2 + "<br>Heart_Rate: " + hr + "<br> Existing_Medical_Condition: " + true_false + "<br>Arbitrary1: " + vf + "<br>Arbitrary2: " + activity;

    var nn_out = (output === "Low Anxiety Level")? 0 : 1;

    var temp = activity/100;

    var nn_in = {data:[ vf , temp , high_bp , high_hr , ptsd ]};

    var temp2 = JSON.stringify(nn_in);

    return {input : inputs , output : output , nn_in: temp2, nn_out: nn_out};
    //hear rate, 72 is normal 100 and over is high, 0 - 100
}

// var netStyle = "relu--single-layer";
// var instance =  Math.floor(Date.now() / 1000);
//set instance for save-json.php
var position2 = 2;
//position from end this network is training for

    // var classes = ("123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz").split("");//not in use, for reference
    var layer_defs2 = [];
    // var out_depth_length = ("15j8cUaneewK7HZwE3G6Q4kDpRS8TQgauq").length;
    // input layer of size 1x1x2 (all volumes are 3D)
    layer_defs2.push({type:'input', out_sx:1, out_sy:1, out_depth:5}); //[[[x,y]]] , x ~ 0 - 1 (.65) == y, x-real frequency, y-> df
    // some fully connected layers
    // layer_defs.push({type:'fc', num_neurons:72, activation:'relu'}); // x->1/(1+e^(-x))
    //layer_defs.push({type:'fc', num_neurons:145, activation:'relu'}); // x->tanh(x)
    //layer_defs.push({type:'fc', num_neuron0s:2, activation:'relu'}); // x->tanh(x)
    layer_defs2.push({type:'fc', num_neurons:22, activation:'relu'}); // x->tanh(x)
    //layer_defs.push({type:'fc', num_neurons:9, activation:'tanh'}); // x->tanh(x)
    //layer_defs.push({type:'fc', num_neurons:5, activation:'tanh'}); // x->tanh(x)
    // console.log(netStyle);
    //layer_defs.push({type:'fc', num_neurons:72, activation:'relu'});
    //layer_defs.push({type:'fc', num_neurons:58, activation:'relu'});
    // a softmax classifier predicting probabilities for two classes: 0,1
    layer_defs2.push({type:'softmax', num_classes:2});

    // create a net out of it
    var net2 = new convnetjs.Net();
    net2.makeLayers(layer_defs2);

    // the network always works on Vol() elements. These are essentially
    // simple wrappers around lists, but also contain gradients and dimensions
    // line below will create a 1x1x2 volume and fill it with 0.5 and -1.3
    var runXor2 = function(){
        // var log;
        var x=0;
        var y=0;
        var k=4;//batch size
        var max = 1000;
        loopInternal2(x,k,max,y);
    };
            var loopInternal2 = function(x,k,max,y){
                var cC2 = 0;
                // console.log("Iteration: " , x);
                count_div2.innerHTML = "Iteration: " + x;
                cC2 += trainXor2(k);
                probability_div2.innerHTML = cC2 + " accuracy";
                scatterChart2.data.datasets[0].data.push({x:cC2, y:y++});
                scatterChart2.update();
                if(cC2 >= 99){
                    // console.log("99% probability achieved");
                    probability_div2.innerHTML = "99% accuracy achieved";
                    // return;
                };
                x++;
                if(x<max){
                    setTimeout(function(){
                        loopInternal2(x,k,max,y);
                    },50);
                }
            }

    var trainXor2 = function(k){
        //input dataset
        //k is batch size
        //probabilty for batch
        var bProb = 0;
        var dIn = [];
        var dIs = [];
        var dataPoint;
        var in_data;
        var out_data;

        var x;
        var trainer;
        var probability_volume2;

        var dataIn;
        var dataOut;

        for(var i=0;i<k;i++){
            dataPoint = null;
            dataPoint = new generateAnxietyDataPoint2();
            // output_div.innerHTML = dataPoint.output;
            // input_div.innerHTML = dataPoint.input;
            in_data = JSON.parse(dataPoint.nn_in);
            // console.log(in_data['data']);
            out_data = dataPoint.nn_out;
            dIn.push(in_data['data']);
            dIs.push(out_data);
        }

        output_div2.innerHTML = dataPoint.output;
        input_div2.innerHTML = dataPoint.input;
        // var dIn = [[0,0],[1,1],[0,1],[1,0]];//
        // var dIs =[0,0,1,1];//
        while(dIn.length > 0){
            dataIn = dIn.pop();
            dataOut = dIs.pop();
            // console.log(dataIn,dataOut,dIn.length);
            x = new convnetjs.Vol(dataIn);
            trainer = new convnetjs.Trainer(net2, {learning_rate:0.01, l2_decay:0.001});
            trainer.train(x, dataOut);
            probability_volume2 = net2.forward(x,dataOut);
            bProb += (parseFloat(probability_volume2.w[dataOut]).toFixed(2) * 100);
        }
        // console.log(bProb);
        return bProb/k;
    };

    var ctx2 = document.getElementById("myChart2").getContext("2d");
    var scatterChart2 = new Chart(ctx2, {
    type: 'scatter',
    data: {
        datasets: [{
            label: 'Accuracy',
            data: [],
            backgroundColor: 'blue'
        }]},
        options: {
            scales: {
                xAxes: [{
                    type: 'linear',
                    position: 'bottom',
                    ticks: {
                        min: 0,
                        max: 100
                    }
                }]
            }
        }
});
runXor2();
</script>
