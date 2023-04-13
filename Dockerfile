FROM rockylinux/rockylinux:8

# Install dependencies
RUN dnf update -y && \
    dnf install -y epel-release && \
    dnf clean all && \
    dnf install -y \
        git \
        squashfs-tools \
        libtool \
        automake \
        autoconf \
        make \
        gcc \
        gcc-c++ \
        golang \
        kernel-devel \
        python3 \
        python3-pip \
        python3-setuptools \
        python3-devel \
        libffi-devel \
        openssl-devel \
        zlib-devel \
        libcurl-devel \
        libxml2-devel \
        libxslt-devel \
        libuuid-devel \
        rpm \
        rpm-build \
        gettext \
        wget \
        cryptsetup \
        glib2-devel \
        crun \
        libseccomp-devel && \
    dnf clean all


# Install Singularity
ENV VERSION=3.11.0

RUN wget https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-ce-${VERSION}.tar.gz && \
    rpmbuild -tb singularity-ce-${VERSION}.tar.gz && \
    rpm -ivh ~/rpmbuild/RPMS/x86_64/singularity-ce-$VERSION-1.el8.x86_64.rpm && \
    rm -rf ~/rpmbuild singularity-ce-$VERSION*.tar.gz

# Install CWLTool
RUN pip3 install cwltool

# Set environment variables
ENV SINGULARITY_CACHEDIR=/tmp/singularity-cache
ENV SINGULARITY_TMPDIR=/tmp/singularity-tmp

# Create Singularity cache and temp directories
RUN mkdir -p /tmp/singularity-cache && \
    mkdir -p /tmp/singularity-tmp

# Set entrypoint to cwltool
ENTRYPOINT ["cwltool"]
# docker build -t cwltool-singularity:latest .

# test executables

RUN singularity --version
RUN cwltool --version