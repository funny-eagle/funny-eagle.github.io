import os
from pathlib import Path

def add_description_to_index_md():
    """
    在pages目录下所有子目录的index.md文件中，在title和date上方添加description字段
    description的值与summary字段的值保持一致
    """
    # 定义pages目录路径
    pages_dir = Path("pages")
    
    # 检查pages目录是否存在
    if not pages_dir.exists():
        print(f"错误: pages目录不存在 - {pages_dir}")
        return False
    
    # 统计处理结果
    total_files = 0
    modified_files = 0
    no_summary_files = 0
    
    # 遍历pages目录下的所有子目录
    for root, dirs, files in os.walk(pages_dir):
        # 检查当前目录下是否有index.md文件
        if "index.md" in files:
            total_files += 1
            index_md_path = Path(root) / "index.md"
            
            try:
                # 读取文件内容
                with open(index_md_path, 'r', encoding='utf-8') as f:
                    lines = f.readlines()
                
                # 检查是否已经存在description字段
                has_description = any(line.strip().startswith('description:') for line in lines)
                if has_description:
                    print(f"已存在description，跳过: {index_md_path}")
                    continue
                
                # 查找summary字段的值
                summary_value = None
                for line in lines:
                    stripped_line = line.strip()
                    if stripped_line.startswith('summary:'):
                        # 提取summary的值（保留引号及内容）
                        summary_value = stripped_line[len('summary:'):].strip()
                        break
                
                if not summary_value:
                    no_summary_files += 1
                    print(f"未找到summary字段，跳过: {index_md_path}")
                    continue
                
                # 查找title或date所在的位置，确定插入点
                insert_position = 0
                for i, line in enumerate(lines):
                    stripped_line = line.strip()
                    if stripped_line.startswith('title:') or stripped_line.startswith('date:'):
                        insert_position = i
                        break
                else:
                    # 如果没有找到title或date，就添加到文件开头
                    insert_position = 0
                
                # 插入description字段
                description_line = f"description:{summary_value}\n"
                lines.insert(insert_position, description_line)
                
                # 确保格式美观，添加空行分隔
                if insert_position > 0 and not lines[insert_position-1].strip() == "":
                    lines.insert(insert_position, "\n")
                
                # 写回文件
                with open(index_md_path, 'w', encoding='utf-8') as f:
                    f.writelines(lines)
                
                modified_files += 1
                print(f"已添加description: {index_md_path}")
                
            except Exception as e:
                print(f"处理文件时出错 {index_md_path}: {str(e)}")
    
    print(f"\n处理完成: 共检查 {total_files} 个index.md文件")
    print(f"成功添加 {modified_files} 个description")
    print(f"未找到summary字段: {no_summary_files} 个")
    return True

def main():
    """程序入口"""
    print("开始为index.md文件添加description...")
    add_description_to_index_md()
    print("description添加操作结束!")

if __name__ == "__main__":
    main()
    
