% This code is slightly modified from the code 'cnn_stn_cluttered_mnist.m' in MatConvNet.

function [net, info] = deep_thermal_imaging_basedon_stncnn(varargin)

    run(fullfile(fileparts(mfilename('fullpath')),...
      '..', '..', 'matlab', 'vl_setupnn.m')) ;
    opts.CHO_CVO=0; opts.iter=0; opts.classnum=0;
    opts.mmfile=[];
    opts.dropout=0;
    opts.dataDir = fullfile(vl_rootnn, 'data') ;
    opts.useSpatialTransformer = true ;
    [opts, varargin] = vl_argparse(opts, varargin) ;

    opts.datapath =fullfile(opts.dataDir, opts.mmfile);

    opts.expDir = fullfile(vl_rootnn, 'data', 'deepthermalimaging') ;

    [opts, varargin] = vl_argparse(opts, varargin) ;

    opts.imdbPath = fullfile(opts.expDir, 'imdb.mat');

    opts.train = struct() ;
    opts = vl_argparse(opts, varargin) ;
    if ~isfield(opts.train, 'gpus'), opts.train.gpus = []; end;

    % --------------------------------------------------------------------
    %                                                         Prepare data
    % --------------------------------------------------------------------

    if exist(opts.imdbPath, 'file')
      imdb = load(opts.imdbPath) ;
    else
      imdb = getImdDB(opts) ;
      mkdir(opts.expDir) ;
      save(opts.imdbPath, '-struct', 'imdb') ;
    end

    net = deep_thermal_imaging_init_basedonn_stncnn([60 60], true, opts.classnum, opts.dropout) ; % initialize the network
    net.meta.classes.name = arrayfun(@(x)sprintf('%d',x),1:opts.classnum,'UniformOutput',false) ;

    % --------------------------------------------------------------------
    %                                                                Train
    % --------------------------------------------------------------------

    fbatch = @(i,b) getBatch(opts.train,i,b);
    [net, info] = cnn_train_dag(net, imdb, fbatch, ...
                                'expDir', opts.expDir, ...
                                net.meta.trainOpts, ...
                                opts.train, ...
                                'val', find(imdb.images.set == 2)) ;


% --------------------------------------------------------------------
function inputs = getBatch(opts, imdb, batch)
% --------------------------------------------------------------------

    if ~isa(imdb.images.data, 'gpuArray') && numel(opts.gpus) > 0
          imdb.images.data = gpuArray(imdb.images.data);
          imdb.images.labels = gpuArray(imdb.images.labels);
    end
    images = imdb.images.data(:,:,:,batch) ;
    labels = imdb.images.labels(1,batch) ;
    inputs = {'input', images, 'label', labels} ;

% --------------------------------------------------------------------
function imdb = getImdDB(opts)

    % Prepare the structure:
    load(opts.datapath, 'train_x','y1')
    trIdx = opts.CHO_CVO.training(opts.iter); 
    teIdx = opts.CHO_CVO.test(opts.iter);
    
    x1=train_x(:,:,trIdx);
    y2=y1; y1=y1(trIdx)'; 

    x2=train_x(:,:,teIdx);
    y2=y2(teIdx)';


    set = [ones(1,numel(y1)) 2*ones(1,numel(y2))];
    x1 = single(reshape(x1,60,60,1,[]));
    x2 = single(reshape(x2,60,60,1,[]));
    data=single(cat(4,x1,x2));

    imdb.images.data = data ;

    imdb.images.labels = cat(2, y1, y2) ;
    imdb.images.set = set ;
    imdb.meta.sets = {'train', 'test'} ;
    imdb.meta.classes = arrayfun(@(x)sprintf('%d',x),1:opts.classnum,'uniformoutput',false) ;


