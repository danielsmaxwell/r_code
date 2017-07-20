setwd('Z:\\drvalle\\uf\\courses\\stats\\maxwell')
k=read.table('arsenic.txt',as.is=T,header=T)

codebook=matrix(c('A','B','C','D','E',
                  '<1/4','~ 1/4','~1/2','~3/4','>3/4'),5,2)
colnames(codebook)=c('usedrink','usedrinkpct')

#solution 1
k1=merge(k,codebook,all=T); dim(k); dim(k1)

#solution 2 (loops+vectorized operations)
k$usedrinkpct=NA
for (i in 1:nrow(codebook)){
  cond=k$usecook==codebook[i,'usedrink']
  k[cond,'usedrinkpct']=codebook[i,'usedrinkpct']
}

#solution 3 (double loop)
k$usedrinkpct=NA
for (i in 1:nrow(k)){
  for (j in 1:nrow(codebook)){
    if(k$usedrink[i]==codebook[j,'usedrink']) k$usedrinkpct[i]=codebook[j,'usedrinkpct']
  }
}

