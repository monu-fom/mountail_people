// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetPostModelAdapter extends TypeAdapter<GetPostModel> {
  @override
  final int typeId = 1;

  @override
  GetPostModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetPostModel(
      currentPage: fields[0] as int,
      data: (fields[1] as List).cast<PostSingle>(),
      firstPageUrl: fields[3] as String,
      from: fields[4] as int,
      lastPage: fields[5] as int,
      lastPageUrl: fields[6] as String,
      links: (fields[7] as List).cast<Link>(),
      nextPageUrl: fields[8] as dynamic,
      path: fields[9] as String,
      perPage: fields[10] as String,
      prevPageUrl: fields[11] as dynamic,
      to: fields[12] as int,
      total: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GetPostModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.currentPage)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.firstPageUrl)
      ..writeByte(4)
      ..write(obj.from)
      ..writeByte(5)
      ..write(obj.lastPage)
      ..writeByte(6)
      ..write(obj.lastPageUrl)
      ..writeByte(7)
      ..write(obj.links)
      ..writeByte(8)
      ..write(obj.nextPageUrl)
      ..writeByte(9)
      ..write(obj.path)
      ..writeByte(10)
      ..write(obj.perPage)
      ..writeByte(11)
      ..write(obj.prevPageUrl)
      ..writeByte(12)
      ..write(obj.to)
      ..writeByte(13)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetPostModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PostSingleAdapter extends TypeAdapter<PostSingle> {
  @override
  final int typeId = 2;

  @override
  PostSingle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostSingle(
      id: fields[0] as int,
      userId: fields[1] as int,
      description: fields[2] as String,
      likeCount: fields[3] as dynamic,
      commentCount: fields[4] as dynamic,
      rePostCount: fields[5] as dynamic,
      postDate: fields[6] as DateTime,
      imagePath: fields[7] as String,
      likeList: (fields[8] as List).cast<String>(),
      bookMark: fields[9] as dynamic,
      tags: fields[10] as String,
      replyPostKeyList: fields[11] as dynamic,
      parentKey: fields[12] as dynamic,
      lanCode: fields[13] as dynamic,
      childRePostKey: fields[14] as dynamic,
      isActive: fields[15] as String,
      itemDeletedDate: fields[16] as dynamic,
      userName: fields[19] as String,
      email: fields[20] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PostSingle obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.likeCount)
      ..writeByte(4)
      ..write(obj.commentCount)
      ..writeByte(5)
      ..write(obj.rePostCount)
      ..writeByte(6)
      ..write(obj.postDate)
      ..writeByte(7)
      ..write(obj.imagePath)
      ..writeByte(8)
      ..write(obj.likeList)
      ..writeByte(9)
      ..write(obj.bookMark)
      ..writeByte(10)
      ..write(obj.tags)
      ..writeByte(11)
      ..write(obj.replyPostKeyList)
      ..writeByte(12)
      ..write(obj.parentKey)
      ..writeByte(13)
      ..write(obj.lanCode)
      ..writeByte(14)
      ..write(obj.childRePostKey)
      ..writeByte(15)
      ..write(obj.isActive)
      ..writeByte(16)
      ..write(obj.itemDeletedDate)
      ..writeByte(19)
      ..write(obj.userName)
      ..writeByte(20)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostSingleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
